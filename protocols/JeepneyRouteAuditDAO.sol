// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JeepneyRouteAuditDAO {
    address public admin;

    struct RouteEntry {
        string routeName;
        string auditType;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    RouteEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRouteAudit(string memory routeName, string memory auditType, string memory emotionalTag) external onlyAdmin {
        entries.push(RouteEntry(routeName, auditType, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealRouteAudit(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getRouteEntry(uint256 index) external view returns (RouteEntry memory) {
        return entries[index];
    }
}
