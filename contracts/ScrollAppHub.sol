// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollAppHub {
    struct Tab {
        string name;
        string description;
        string route;
        bool active;
    }

    Tab[] public tabs;
    mapping(string => uint256) public tabIndex;

    event TabAdded(string name, string route);
    event TabUpdated(string name, bool active);

    function addTab(string calldata name, string calldata description, string calldata route) external {
        tabs.push(Tab(name, description, route, true));
        tabIndex[name] = tabs.length - 1;
        emit TabAdded(name, route);
    }

    function updateTabStatus(string calldata name, bool active) external {
        uint256 index = tabIndex[name];
        tabs[index].active = active;
        emit TabUpdated(name, active);
    }

    function getTab(string calldata name) external view returns (string memory, string memory, string memory, bool) {
        uint256 index = tabIndex[name];
        Tab memory t = tabs[index];
        return (t.name, t.description, t.route, t.active);
    }

    function totalTabs() external view returns (uint256) {
        return tabs.length;
    }
}
