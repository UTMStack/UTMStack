import {
  Component,
  EventEmitter,
  Input,
  OnDestroy,
  OnInit,
  Output, Type,
  ViewChild,
  ViewContainerRef
} from '@angular/core';
import {Subject} from 'rxjs';
import {takeUntil} from 'rxjs/operators';
import {IndexPatternBehavior} from '../../../../../../log-analyzer/shared/behaviors/index-pattern.behavior';
import {SortEvent} from '../../../../../directives/sortable/type/sort-event';
import {ElasticDataTypesEnum} from '../../../../../enums/elastic-data-types.enum';
import {UtmDateFormatEnum} from '../../../../../enums/utm-date-format.enum';
import {UtmFieldType} from '../../../../../types/table/utm-field.type';
import {
  convertObjectToKeyValueArray,
  extractValueFromObjectByPath
} from '../../../../../util/get-value-object-from-property-path.util';
import {SUMMARY_COLUMNS} from './summary-fields';

@Component({
  selector: 'app-dynamic-table',
  templateUrl: './dynamic-table.component.html',
  styleUrls: ['./dynamic-table.component.scss']
})
export class UtmDynamicTableComponent implements OnInit, OnDestroy {
  /**
   * Field to show in header
   */
  @Input() fields: UtmFieldType[] = [];

  /**
   * Data to show
   */
  @Input() rows: any[] = [];
  /**
   * Loading signal
   */
  @Input() loading: boolean;
  @Input() totalItems: number;
  @Input() page: number;
  @Input() itemsPerPage: number;
  /**
   * Show invisible columns in columns management
   */
  @Input() showInactiveColumns;
  /**
   * Determine if show detail or not default true
   */
  @Input() showDetail = true;
  /**
   * Determine if show delete in header
   */
  @Input() viewDeleteAction: boolean;
  /**
   * Component to show in detail
   */
  @Input() componentDetail: Type<any>;
  /**
   * Event emit when page change, number of page
   */
  @Output() pageChange = new EventEmitter<number>();
  /**
   * Event emit when size per page change
   */
  @Output() sizeChange = new EventEmitter<number>();
  /**
   * Event emit when sort table
   */
  @Output() sortBy = new EventEmitter<string>();
  /**
   * Event emit when columns was deleted, emit type UtmTableFieldType
   */
  @Output() removeColumn = new EventEmitter<UtmFieldType>();
  /**
   * Var to put table max width
   */
  @Input() tableWidth: number;
  /**
   * Determine if show edit columns property
   */
  @Input() editableColumn = true;
  @ViewChild('container', {read: ViewContainerRef}) entry: ViewContainerRef;
  viewDetail = -1;
  @Input() pageable = true;
  dataTypeEnum = ElasticDataTypesEnum;
  utmDateFormat = UtmDateFormatEnum;
  destroy$: Subject<void> = new Subject<void>();

  summaryColumns = [];

  constructor(private indexPatternBehavior: IndexPatternBehavior) {
  }

  ngOnInit(): void {
    this.indexPatternBehavior.pattern$
      .pipe(takeUntil(this.destroy$))
      .subscribe((log) => {
        this.summaryColumns = SUMMARY_COLUMNS.filter( s =>
          s.pattern.toLowerCase().includes(log.pattern.pattern.toLowerCase()))[0].fields;
    });
  }

  onSort($event: SortEvent) {
    this.sortBy.emit($event.column + ',' + $event.direction);
  }

  resolveTdValue(row: any, td: UtmFieldType): any {
    const value = extractValueFromObjectByPath(row, td);
    return td.type === this.dataTypeEnum.DATE && value === '-' ?
      null : value;
  }

  processSourceDocument(row: any): Promise<string> {
    return new Promise<string>(resolve => {
      let html = '';
      this.buildIterateFieldSource(row).then(content => {
        html = '<div class="truncate-by-height">' +
          '<span>' + '<dl class="source truncate-by-height">' +
          content
          + '</dl></span></div>';
      });
      resolve(html);
    });
  }

  buildIterateFieldSource(row): Promise<string> {
    return new Promise<string>(resolve => {
      let html = '';
      for (const source of convertObjectToKeyValueArray(row)) {
        html += '<dt>' + source.key + '</dt>' +
          '<dd><span>' + source.value + '</span>' +
          '</dd>';
      }
      resolve(html);
    });
  }

  /**
   * Find in all field if column type text has keyword
   * @param column Column to check if column cant be sort
   */
  isSortableColumn(column: UtmFieldType): boolean {
    if (column.type === ElasticDataTypesEnum.TEXT || column.type === ElasticDataTypesEnum.STRING) {
      return column.field.includes('.keyword');
    } else {
      return true;
    }
  }

  resolveTableHeaderName(column: UtmFieldType): string {
    if (column.label) {
      return column.label;
    } else {
      return column.field.includes('.keyword') ? column.field.replace('.keyword', '') : column.field;
    }
  }

  ngOnDestroy(): void {
    this.destroy$.next();
    this.destroy$.complete();
  }

}
