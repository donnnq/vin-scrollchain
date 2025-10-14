// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalTechTreatyDAO {
    address public admin;

    struct TreatyEntry {
        string treatyName;
        string signatoryRegion;
        string techSector;
        string emotionalTag;
        bool ratified;
    }

    TreatyEntry[] public treaties;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTreaty(string memory _treatyName, string memory _signatoryRegion, string memory _techSector, string memory _emotionalTag) external onlyAdmin {
        treaties.push(TreatyEntry(_treatyName, _signatoryRegion, _techSector, _emotionalTag, false));
    }

    function ratifyTreaty(uint256 index) external onlyAdmin {
        treaties[index].ratified = true;
    }

    function getTreaty(uint256 index) external view returns (TreatyEntry memory) {
        return treaties[index];
    }
}
