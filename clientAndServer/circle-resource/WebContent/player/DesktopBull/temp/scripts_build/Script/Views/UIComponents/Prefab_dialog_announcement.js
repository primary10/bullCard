"use strict";
cc._RF.push(module, '0a979XuE+1DBZdWzYrxkmwc', 'Prefab_dialog_announcement');
// Script/Views/UIComponents/Prefab_dialog_announcement.js

'use strict';

//公告弹窗界面
cc.Class({
    extends: require('BaseDialog'),

    properties: {
        _lastTouchBtn: null, //上次点击的按钮
        _list_prefabs: null, //所有预制体
        prefab_versionAnnouncement: {
            default: null,
            type: cc.Prefab,
            displayName: '版本公告预制体'
        },
        prefab_officialDescAnnouncement: {
            default: null,
            type: cc.Prefab,
            displayName: '官方说明预制体'
        }
    },

    // use this for initialization
    onLoad: function onLoad() {
        this._super();

        this._comp_exchangPages = this.getComponent('Part_dialog_exchangePages');

        var dataObj = G_OBJ.data_dialog_exchangePages();
        dataObj.leftDealScrollComp = this.comp_leftBtnContainer;
        dataObj.leftPrefab = this.prefab_leftButton;
        dataObj.leftContentList = ['版本公告', '官方说明'];
        dataObj.leftClickFunc = null;
        dataObj.rightDealScrollComp = this.comp_itemContainer;
        dataObj.rightPrefabList = [this.prefab_versionAnnouncement, this.prefab_officialDescAnnouncement];
        this._comp_exchangPages.initData(dataObj);
    },

    start: function start() {
        this._comp_exchangPages.showDefault(true);
    }

});

cc._RF.pop();