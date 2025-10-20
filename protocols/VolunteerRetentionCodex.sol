// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VolunteerRetentionCodex {
    address public admin;

    struct RetentionEntry {
        string platformName;
        string volunteerType;
        string retentionClause;
        string emotionalTag;
        bool summoned;
        bool supported;
        bool sealed;
    }

    RetentionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRetention(string memory platformName, string memory volunteerType, string memory retentionClause, string memory emotionalTag) external onlyAdmin {
        entries.push(RetentionEntry(platformName, volunteerType, retentionClause, emotionalTag, true, false, false));
    }

    function confirmSupport(uint256 index) external onlyAdmin {
        entries[index].supported = true;
    }

    function sealRetentionEntry(uint256 index) external onlyAdmin {
        require(entries[index].supported, "Must be supported first");
        entries[index].sealed = true;
    }

    function getRetentionEntry(uint256 index) external view returns (RetentionEntry memory) {
        return entries[index];
    }
}
