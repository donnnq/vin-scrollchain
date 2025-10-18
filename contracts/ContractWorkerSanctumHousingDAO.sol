// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractWorkerSanctumHousingDAO {
    address public admin;

    struct HousingEntry {
        string workerName;
        string housingType;
        string projectSite;
        string emotionalTag;
        bool summoned;
        bool granted;
    }

    HousingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonHousing(string memory workerName, string memory housingType, string memory projectSite, string memory emotionalTag) external onlyAdmin {
        entries.push(HousingEntry(workerName, housingType, projectSite, emotionalTag, true, false));
    }

    function grantHousing(uint256 index) external onlyAdmin {
        entries[index].granted = true;
    }

    function getHousingEntry(uint256 index) external view returns (HousingEntry memory) {
        return entries[index];
    }
}
