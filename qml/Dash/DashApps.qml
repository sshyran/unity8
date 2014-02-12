/*
 * Copyright (C) 2013 Canonical, Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0
import Ubuntu.Components 0.1
import Utils 0.1
import "../Components"
import "../Components/ListItems"
import "Apps"

GenericScopeView {
    id: scopeView
    objectName: "DashApps"

    // FIXME: a way to aggregate these models would be ideal
    property var mainStageApplicationsModel: shell.applicationManager.mainStageApplications
    property var sideStageApplicationModel: shell.applicationManager.sideStageApplications

    QtObject {
        id: countObject
        property int count: scopeView.scope.searchQuery.length == 0 ? (mainStageApplicationsModel.count + sideStageApplicationModel.count) : 0
    }

    onScopeChanged: {
        scopeView.scope.categories.addSpecialCategory("running.apps.category", "Running Apps", "", "{ \"template\": { \"category-layout\": \"running-apps\" } }", countObject);
        enableHeightBehaviorOnNextCreation = (mainStageApplicationsModel.count + sideStageApplicationModel.count == 0)
    }
}
