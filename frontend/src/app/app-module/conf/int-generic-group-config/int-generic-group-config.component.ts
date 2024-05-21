import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {forkJoin, of} from 'rxjs';
import {finalize, map, switchMap, tap} from 'rxjs/operators';
import {ModalService} from '../../../core/modal/modal.service';
import {UtmToastService} from '../../../shared/alert/utm-toast.service';
import {ModalConfirmationComponent} from '../../../shared/components/utm/util/modal-confirmation/modal-confirmation.component';
import {EncryptService} from '../../../shared/services/util/encrypt.service';
import {ModuleChangeStatusBehavior} from '../../shared/behavior/module-change-status.behavior';
import {IntCreateGroupComponent} from '../../shared/components/int-create-group/int-create-group.component';
import {GroupTypeEnum} from '../../shared/enum/group-type.enum';
import {UtmModulesEnum} from '../../shared/enum/utm-module.enum';
import {UtmModuleCollectorService} from '../../shared/services/utm-module-collector.service';
import {UtmModuleGroupConfService} from '../../shared/services/utm-module-group-conf.service';
import {UtmModuleGroupService} from '../../shared/services/utm-module-group.service';
import {UtmModuleCollectorType} from '../../shared/type/utm-module-collector.type';
import {UtmModuleGroupConfType} from '../../shared/type/utm-module-group-conf.type';
import {UtmModuleGroupType} from '../../shared/type/utm-module-group.type';

@Component({
  selector: 'app-int-generic-group-config',
  templateUrl: './int-generic-group-config.component.html',
  styleUrls: ['./int-generic-group-config.component.css']
})
export class IntGenericGroupConfigComponent implements OnInit {
  @Input() serverId: number;
  @Input() moduleId: number;
  @Input() groupType: number = GroupTypeEnum.TENANT;
  @Input() allowAdd = true;
  @Input() editable = true;
  @Output() configValidChange = new EventEmitter<boolean>();
  groups: UtmModuleGroupType[];
  loading = true;
  pendingChanges = false;
  changes: { keys: UtmModuleGroupConfType[], moduleId: number };
  savingConfig = false;
  btnTittle: string;
  GroupTypeEnum = GroupTypeEnum;
  collectors: any[];
  collectorList: UtmModuleCollectorType[] = [];
  configs: UtmModuleGroupConfType[] = [];

  constructor(private utmModuleGroupService: UtmModuleGroupService,
              private toast: UtmToastService,
              private encryptService: EncryptService,
              private utmModuleGroupConfService: UtmModuleGroupConfService,
              private modalService: ModalService,
              private moduleChangeStatusBehavior: ModuleChangeStatusBehavior,
              private collectorService: UtmModuleCollectorService, ) {
  }

  ngOnInit() {
    this.getGroups();
    this.changes = {keys: [], moduleId: this.moduleId};
    this.btnTittle = this.groupType === GroupTypeEnum.TENANT ?
      'Add tenant' : 'Add collector';
  }

  getGroups() {
    /*this.utmModuleGroupService.query({moduleId: this.moduleId})
      .subscribe(response => {
      this.groups = response.body;
      this.configValidChange.emit(this.tenantGroupConfigValid());
      if (this.groupType === GroupTypeEnum.COLLECTOR) {
          this.collectorService.query({module: UtmModulesEnum.AS_400})
              .pipe(
                  map(response => {
                    response.body.collectors = response.body.collectors.filter(c => c.status === 'ONLINE');
                    return response;
                  }),
                tap((response) =>
                  this.collectors = this.collectorService.formatCollectorResponse(this.groups, response.body.collectors)
                ),
                finalize(() => this.loading = false)
              )
              .subscribe(response => {
                this.collectorList = response.body.collectors;
              });
        } else {
          this.loading = false;
        }
    });*/

    this.loading = true;

    this.utmModuleGroupService.query({ moduleId: this.moduleId }).pipe(
      tap(response => {
        this.groups = response.body;
        this.configValidChange.emit(this.tenantGroupConfigValid());
      }),
      switchMap(response => {
        if (this.groupType === GroupTypeEnum.COLLECTOR) {
          return this.collectorService.query({ module: UtmModulesEnum.AS_400 }).pipe(
            map(response => {
              response.body.collectors = response.body.collectors.filter(c => c.status === 'ONLINE');
              return response;
            }),
            tap(response => {
              this.collectors = this.collectorService.formatCollectorResponse(this.groups, response.body.collectors);
              this.collectorList = response.body.collectors;
            })
          );
        } else {
          return of(null); // Emitir un valor nulo para seguir con el flujo sin hacer otra llamada API
        }
      }),
      finalize(() => this.loading = false)).subscribe();
  }

  createGroup() {
    const modal = this.modalService.open(IntCreateGroupComponent, {centered: true});
    modal.componentInstance.moduleId = this.moduleId;
    modal.componentInstance.groupType = this.groupType;
    modal.componentInstance.collectors = this.collectorList;
    modal.componentInstance.groupChange.subscribe(group => {
      this.getGroups();
    });
  }

  editGroup(group: UtmModuleGroupType) {
    const modal = this.modalService.open(IntCreateGroupComponent, {centered: true});
    modal.componentInstance.moduleId = this.moduleId;
    modal.componentInstance.group = group;
    modal.componentInstance.groupChange.subscribe(groupResponse => {
      this.getGroups();
    });
  }

  deleteGroup(group: UtmModuleGroupType) {
    const deleteModal = this.modalService.open(ModalConfirmationComponent, {centered: true});
    deleteModal.componentInstance.header = 'Delete tenant';
    deleteModal.componentInstance.message = 'By deleting ' + group.groupName + ' tenant, UTMStack will no longer receive logs from this source.' +
        (this.groups.length === 1 ? ' Since this is the only tenant, the module associated with it will be deactivated.' : '') +
        ' Are you sure that you want to delete this tenant?';

    deleteModal.componentInstance.confirmBtnText = 'Delete';
    deleteModal.componentInstance.confirmBtnIcon = 'icon-stack-cancel';
    deleteModal.componentInstance.confirmBtnType = 'delete';
    deleteModal.result.then(() => {
      this.deleteAction(group);
    });
  }

  deleteAction(group: UtmModuleGroupType) {
    this.utmModuleGroupService.delete(group.id).subscribe(response => {
      if (this.groups.length === 1) {
        this.moduleChangeStatusBehavior.setStatus(false);
      } else {
        this.toast.showSuccessBottom('Tenant group deleted successfully');
      }
      this.getGroups();
    }, error => {
      this.toast.showError('Error deleting tenant',
        'Error while trying to delete tenant ' + group.groupName + ' , please try again');
    });
  }

  saveConfig(group: UtmModuleGroupType) {
    this.savingConfig = true;
    const configs = this.changes.keys.filter(change => change.groupId === group.id);
    this.utmModuleGroupConfService.update({
      moduleId: group.moduleId,
      keys: configs
    }).subscribe(response => {
      this.savingConfig = false;
      this.pendingChanges = false;
      this.changes = {keys: [], moduleId: this.moduleId};
      this.configValidChange.emit(this.tenantGroupConfigValid());
      this.toast.showSuccessBottom('Configuration saved successfully');
    }, () => {
      this.toast.showError('Error saving configuration',
        'Error while trying to save tenant configuration , please try again');
    });
  }

  tenantIsConfigValid(group: UtmModuleGroupType): boolean {

    const required = group.moduleGroupConfigurations.filter(value => value.confRequired === true);
    const valid = required.filter(value => value.confValue !== null && value.confValue);

    if (this.groupType === GroupTypeEnum.COLLECTOR) {
      return valid.length === required.length && !this.validateUniqueHostNameByCollector(group);
    } else {
      return valid.length === required.length;
    }
  }

  tenantGroupConfigValid(): boolean {
    let required = [];
    let valid = [];
    this.groups.forEach((group) => {
      required = group.moduleGroupConfigurations.filter(value => value.confRequired === true);
      valid = required.filter(value => value.confValue !== null && value.confValue);
    });
    return this.groups.length > 0 && valid.length === required.length;
  }

  checkConfigValue(config: string): boolean {
    return config !== null && config !== '' && config !== undefined;
  }

  addChange(integrationConfig: UtmModuleGroupConfType) {
    this.pendingChanges = true;
    const index = this.changes.keys
      .findIndex(value => value.confName === integrationConfig.confName &&
        value.groupId === integrationConfig.groupId);
    if (index === -1) {
      this.changes.keys.push(integrationConfig);
    } else {
      this.changes.keys[index].confValue = integrationConfig.confValue;
    }
    // this.configValidChange.emit(this.tenantGroupConfigValid());
  }

  cancelConfig(group: UtmModuleGroupType) {
    this.utmModuleGroupService.find(group.id).subscribe(response => {
      const index = this.groups.indexOf(group);
      if (index !== -1) {
        this.groups[index].moduleGroupConfigurations = response.body.moduleGroupConfigurations;
      }
      // tslint:disable-next-line:prefer-for-of
      for (let i = 0; i < this.changes.keys.length; i++) {
        if (this.changes.keys[i].groupId === group.id) {
          this.changes.keys.splice(i, 1);
        }
      }
      this.configValidChange.emit(this.tenantGroupConfigValid());
    });
  }

  pendingChangesForGroup(group: UtmModuleGroupType): boolean {
    return this.changes.keys.filter(value => value.groupId === group.id).length > 0;
  }

  pendingChangesForCollector(groups: UtmModuleGroupType[]): boolean {
    return groups.some(group => this.pendingChangesForGroup(group));
  }

  onFileUpload($event: any[], group: UtmModuleGroupType, integrationConfig: UtmModuleGroupConfType) {
    if (integrationConfig.confKey === 'jsonKey') {
      this.encryptService.encrypt(JSON.stringify($event[0])).subscribe(response => {
        const indexGroup = this.groups.findIndex(value => value.id === group.id);
        const indexConf = this.groups[indexGroup].moduleGroupConfigurations.findIndex(value => value.id === integrationConfig.id);
        this.groups[indexGroup].moduleGroupConfigurations[indexConf].confValue = response.body;
        this.addChange(integrationConfig);
      });
    }
  }

  collectorValid(groups: UtmModuleGroupType[]) {
    return groups.every(group => this.tenantIsConfigValid(group));
  }

  collectorConfigValid(groups: UtmModuleGroupType[]) {
    return groups.some(group => this.tenantIsConfigValid(group));
  }

  cancelCollectorConfig(groups: UtmModuleGroupType []) {
   groups.forEach(group => this.cancelConfig(group));
  }

  saveCollectorConfig(collector: any) {
    this.configs = [];
    collector.groups.forEach((item: { moduleGroupConfigurations: any; }) => {
      const configurations = item.moduleGroupConfigurations;
      this.configs.push(...configurations);
    });
    const body = {
      collectorConfig: {
        moduleId: this.moduleId,
        keys: this.configs
      },
      collector: this.collectorList.find(c => c.hostname === collector.collector),
    };
    this.collectorService.create(body).subscribe(response => {
      console.log(response);
    });
  }

  addConfig(collector: any) {
    const col = this.collectorList.find(c => c.hostname === collector.collector);
    this.utmModuleGroupService.create({
      description: '',
      moduleId: this.moduleId,
      name: `Group ${collector.groups.length} ${collector.collector}`,
      collector: col.id
    }).subscribe(response => {
      this.getGroups();
    }, () => {
    });
  }

  deleteCollectorConfig(collector: any) {
    const deleteModal = this.modalService.open(ModalConfirmationComponent, {centered: true});
    deleteModal.componentInstance.header = 'Delete collector';
    deleteModal.componentInstance.message = 'By deleting this collector, UTMStack will no longer receive logs from this source.' +
      (this.groups.length === 1 ? ' Since this is the only tenant, the module associated with it will be deactivated.' : '') +
      ' Are you sure that you want to delete this collector?';

    deleteModal.componentInstance.confirmBtnText = 'Delete';
    deleteModal.componentInstance.confirmBtnIcon = 'icon-stack-cancel';
    deleteModal.componentInstance.confirmBtnType = 'delete';
    deleteModal.result.then(() => {
        const deleteRequests = collector.groups.map( g => this.utmModuleGroupService.delete(g.id));

        forkJoin(deleteRequests).subscribe(() => {
          this.getGroups();
        },
            (error) => {
                console.error('Error al procesar las solicitudes de eliminación:', error);
            }
        );
    });
  }

  validateUniqueHostNameByCollector(group: UtmModuleGroupType) {
      const configs = [];

      const config = group.moduleGroupConfigurations.find(c => c.confName === 'Hostname');
      const groups = this.groups.filter(g => g.collector === g.collector && g.id !== group.id);

      groups.forEach((item: { moduleGroupConfigurations: any; }) => {
        const configurations = item.moduleGroupConfigurations;
        configs.push(...configurations);
      });

      return configs.some(c => c.confName === 'Hostname' && c.confValue === config.confValue);
  }
}
