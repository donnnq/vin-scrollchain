// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForestPasigConnectivityDAO {
    address public admin;

    struct ConnectivityEntry {
        string origin;
        string destination;
        string connectionType; // "Walkway", "Bridge", "Green Corridor"
        string emotionalTag;
        bool summoned;
        bool linked;
        bool sealed;
    }

    ConnectivityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonConnection(string memory origin, string memory destination, string memory connectionType, string memory emotionalTag) external onlyAdmin {
        entries.push(ConnectivityEntry(origin, destination, connectionType, emotionalTag, true, false, false));
    }

    function confirmLinkage(uint256 index) external onlyAdmin {
        entries[index].linked = true;
    }

    function sealConnectivityEntry(uint256 index) external onlyAdmin {
        require(entries[index].linked, "Must be linked first");
        entries[index].sealed = true;
    }

    function getConnectivityEntry(uint256 index) external view returns (ConnectivityEntry memory) {
        return entries[index];
    }
}
