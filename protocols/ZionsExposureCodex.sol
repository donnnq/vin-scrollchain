// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZionsExposureCodex {
    address public admin;

    struct ExposureEntry {
        string institution;
        string fraudTrigger;
        string exposureAmount;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    ExposureEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonExposure(string memory institution, string memory fraudTrigger, string memory exposureAmount, string memory emotionalTag) external onlyAdmin {
        entries.push(ExposureEntry(institution, fraudTrigger, exposureAmount, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealExposureEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getExposureEntry(uint256 index) external view returns (ExposureEntry memory) {
        return entries[index];
    }
}
