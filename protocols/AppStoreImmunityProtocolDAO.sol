// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AppStoreImmunityProtocolDAO {
    address public admin;

    struct AppEntry {
        string appName;
        string store;
        string emotionalTag;
        bool summoned;
        bool flagged;
        bool immunityGranted;
    }

    AppEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonApp(string memory appName, string memory store, string memory emotionalTag) external onlyAdmin {
        entries.push(AppEntry(appName, store, emotionalTag, true, false, false));
    }

    function flagApp(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function grantImmunity(uint256 index) external onlyAdmin {
        require(entries[index].flagged, "Must be flagged first");
        entries[index].immunityGranted = true;
    }

    function getAppEntry(uint256 index) external view returns (AppEntry memory) {
        return entries[index];
    }
}
