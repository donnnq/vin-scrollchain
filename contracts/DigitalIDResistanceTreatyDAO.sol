// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalIDResistanceTreatyDAO {
    address public admin;

    struct TreatyEntry {
        string country;
        string resistanceClause;
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

    function submitTreaty(string memory _country, string memory _resistanceClause, string memory _emotionalTag) external onlyAdmin {
        treaties.push(TreatyEntry(_country, _resistanceClause, _emotionalTag, false));
    }

    function ratifyTreaty(uint256 index) external onlyAdmin {
        treaties[index].ratified = true;
    }

    function getTreaty(uint256 index) external view returns (TreatyEntry memory) {
        return treaties[index];
    }
}
