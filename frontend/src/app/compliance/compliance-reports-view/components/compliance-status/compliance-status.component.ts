import {ChangeDetectionStrategy, Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {Observable} from 'rxjs';
import {concatMap, filter, map, startWith, tap} from 'rxjs/operators';
import {ModalService} from '../../../../core/modal/modal.service';
import {UtmRenderVisualization} from '../../../../dashboard/shared/services/utm-render-visualization.service';
import {RunVisualizationService} from '../../../../graphic-builder/shared/services/run-visualization.service';
import {VisualizationType} from '../../../../shared/chart/types/visualization.type';
import {ModalAddNoteComponent} from '../../../../shared/components/utm/util/modal-add-note/modal-add-note.component';
import {ChartTypeEnum} from '../../../../shared/enums/chart-type.enum';
import {TimeWindowsService} from '../../../shared/components/utm-cp-section/time-windows.service';
import {ComplianceReportType} from '../../../shared/type/compliance-report.type';
import {UtmDashboardVisualizationType} from '../../../../shared/chart/types/dashboard/utm-dashboard-visualization.type';


export type ComplianceStatus = 'complaint' | 'non_complaint';

@Component({
  selector: 'app-compliance-status',
  templateUrl: './compliance-status.component.html',
  styleUrls: ['./compliance-status.component.css'],
  changeDetection: ChangeDetectionStrategy.OnPush
})
export class ComplianceStatusComponent implements OnInit {
  @Input() template: 'default' | 'dropdown' = 'default';
  private _report: ComplianceReportType;
  compliance$: Observable<{ status: boolean }> = null;
  request = {
    page: 0,
    size: 10000,
    sort: 'order,asc',
    'idDashboard.equals': 0
  };
  vis: VisualizationType;

  @Output() isCompliant = new EventEmitter<boolean>();
  @Output() visualization = new EventEmitter<any>();
  changing: any;
  status: ComplianceStatus = 'complaint';
  loading = false;

  constructor(private utmRenderVisualization: UtmRenderVisualization,
              private runVisualization: RunVisualizationService,
              private timeWindowsService: TimeWindowsService,
              private modalService: ModalService) {
  }

  ngOnInit() {
    /*this.compliance$ = this.utmRenderVisualization.onRefresh$
      .pipe(
        filter((refresh) => !!refresh),
        concatMap(() => this.utmRenderVisualization.query(this.request)
          .pipe(
            map(response => response.body.filter(vis =>
              vis.visualization.chartType === ChartTypeEnum.TABLE_CHART || vis.visualization.chartType === ChartTypeEnum.LIST_CHART
            )),
            filter(vis => vis.length > 0),
            map(vis => {
              this.visualization.emit(vis);
              return vis[0].visualization;
            }),
            tap( vis => {
              const time = vis.filterType.find( filterType => filterType.field === '@timestamp');
              if (time) {
                this.timeWindowsService.changeTimeWindows({
                  reportId: this.report.id,
                  time: time.value[0]
                });
              }
            }),
            concatMap((vis: VisualizationType) => this.runVisualization.run(vis)),
            map(run => {
              const isCompliant = run[0] && run[0].rows.length > 0;
              this.report.status = isCompliant || this.report.note && this.report.note !== '' ? 'complaint'
                 : 'non_complaint';
              this.isCompliant.emit(isCompliant);
              return {
                status: isCompliant
              };
            })
          ))
      );*/

    this.compliance$ = this.utmRenderVisualization.onRefresh$
      .pipe(
        filter((refresh) => !!refresh),
        concatMap(() => this.runVisualization.run(this.vis)),
        map(run => {
          const isCompliant = run[0] && run[0].rows.length > 0;
          this.report.status = isCompliant || this.report.configReportNote && this.report.configReportNote !== '' ? 'complaint'
            : 'non_complaint';
          this.isCompliant.emit(isCompliant);
          return {
            status: isCompliant
          };
        }),
      );
  }

  @Input() set report(value: ComplianceReportType) {
    if (value) {
      this._report = value;
      const visualizationType: UtmDashboardVisualizationType = value.dashboard.find(vis =>
        vis.visualization.chartType === ChartTypeEnum.TABLE_CHART || vis.visualization.chartType === ChartTypeEnum.LIST_CHART);

      if (visualizationType) {
        this.visualization.emit(visualizationType);
        this.vis = visualizationType.visualization;
      }
      const time = visualizationType.visualization.filterType.find(filterType => filterType.field === '@timestamp');
      if (time) {
        this.timeWindowsService.changeTimeWindows({
          reportId: value.id,
          time: time.value[0]
        });
      }

      this.utmRenderVisualization.notifyRefresh(true);
    }
  }

  get report() {
    return this._report;
  }

  onClick(event: Event) {
    event.stopPropagation();
  }

  changeStatusTo(status: ComplianceStatus) {
    const modalRef = this.modalService.open(ModalAddNoteComponent, {centered: true});
    modalRef.componentInstance.report = this.report;
    modalRef.componentInstance.header = 'Confirm status change';
    modalRef.componentInstance.message = this.getModalMessage(status);
    modalRef.componentInstance.confirmBtnText = 'Confirm';
    modalRef.componentInstance.confirmBtnIcon = 'icon-checkmark-circle';
    modalRef.componentInstance.confirmBtnType = 'confirm';
    modalRef.componentInstance.cancelBtnText = 'Cancel';
    modalRef.result.then(() => {
      // this.reportService.loadReportNote(this.report);
    });
  }

  getModalMessage(status: ComplianceStatus) {
    return status === 'complaint'
      ? `You are about to change the compliance status to <b>Complaint (External Tool)</b>.
       <br><br>
       Please note that you must provide a detailed note explaining where and how this compliance
       is being fulfilled using the external tool.
       <br><br>
       Are you sure you want to proceed?`
      : status === 'non_complaint'
        ? `You are about to change the compliance status to <b>Non Compliant</b>.
       <br><br>
       Please note that the note associated with this compliance will be permanently removed.
       <br><br>
       Are you sure you want to proceed?`
        : '';
  }
}
