// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicBehaviorAuditDAO {
    address public admin;

    struct BehaviorEntry {
        string action;
        string location;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    BehaviorEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBehavior(string memory action, string memory location, string memory emotionalTag) external onlyAdmin {
        entries.push(BehaviorEntry(action, location, emotionalTag, true, false, false));
    }

    function auditBehavior(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealAudit(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getBehaviorEntry(uint256 index) external view returns (BehaviorEntry memory) {
        return entries[index];
    }
}
