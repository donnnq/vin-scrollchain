// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RemoteOverrideEthicsCodex {
    address public admin;

    struct OverrideEntry {
        string systemName;
        string controlType;
        string ethicsClause;
        string emotionalTag;
        bool summoned;
        bool endorsed;
        bool sealed;
    }

    OverrideEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonOverride(string memory systemName, string memory controlType, string memory ethicsClause, string memory emotionalTag) external onlyAdmin {
        entries.push(OverrideEntry(systemName, controlType, ethicsClause, emotionalTag, true, false, false));
    }

    function confirmEndorsement(uint256 index) external onlyAdmin {
        entries[index].endorsed = true;
    }

    function sealOverrideEntry(uint256 index) external onlyAdmin {
        require(entries[index].endorsed, "Must be endorsed first");
        entries[index].sealed = true;
    }

    function getOverrideEntry(uint256 index) external view returns (OverrideEntry memory) {
        return entries[index];
    }
}
