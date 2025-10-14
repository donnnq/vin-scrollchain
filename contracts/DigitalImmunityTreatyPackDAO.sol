// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalImmunityTreatyPackDAO {
    address public admin;

    struct TreatyEntry {
        string immunityType;
        string jurisdiction;
        string treatyClause;
        string emotionalTag;
        bool sealed;
    }

    TreatyEntry[] public treaties;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTreaty(string memory _immunityType, string memory _jurisdiction, string memory _treatyClause, string memory _emotionalTag) external onlyAdmin {
        treaties.push(TreatyEntry(_immunityType, _jurisdiction, _treatyClause, _emotionalTag, false));
    }

    function sealTreaty(uint256 index) external onlyAdmin {
        treaties[index].sealed = true;
    }

    function getTreaty(uint256 index) external view returns (TreatyEntry memory) {
        return treaties[index];
    }
}
