// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ScrollBitForkTab
/// @notice Manages forked UI tabs in Bitrefill‐style extension layout.
contract ScrollBitForkTab {
    struct Tab {
        string name;
        string url;
        bool active;
    }

    uint256 public nextTabId;
    mapping(uint256 => Tab) public tabs;
    mapping(address => uint256[]) public userTabs;

    event TabAdded(uint256 indexed tabId, string name, string url);
    event TabUpdated(uint256 indexed tabId, string name, string url, bool active);
    event TabBound(address indexed user, uint256 indexed tabId);

    /// @notice Adds a new extension tab
    function addTab(string calldata name, string calldata url) external {
        tabs[nextTabId] = Tab(name, url, true);
        emit TabAdded(nextTabId, name, url);
        nextTabId++;
    }

    /// @notice Updates an existing tab’s metadata or active status
    function updateTab(
        uint256 tabId,
        string calldata name,
        string calldata url,
        bool active
    ) external {
        require(tabId < nextTabId, "Invalid tabId");
        Tab storage t = tabs[tabId];
        t.name = name;
        t.url = url;
        t.active = active;
        emit TabUpdated(tabId, name, url, active);
    }

    /// @notice Bind a tab to the caller’s dashboard
    function bindTab(uint256 tabId) external {
        require(tabId < nextTabId, "Invalid tabId");
        userTabs[msg.sender].push(tabId);
        emit TabBound(msg.sender, tabId);
    }

    /// @notice Get all tabs bound to a specific user
    function getUserTabs(address user) external view returns (uint256[] memory) {
        return userTabs[user];
    }
}
