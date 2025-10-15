// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CrossBorderLaborTreatyRegistryDAO {
    address public admin;

    struct TreatyEntry {
        string countryA;
        string countryB;
        string laborClause;
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

    function submitTreaty(string memory _countryA, string memory _countryB, string memory _laborClause, string memory _emotionalTag) external onlyAdmin {
        treaties.push(TreatyEntry(_countryA, _countryB, _laborClause, _emotionalTag, false));
    }

    function ratifyTreaty(uint256 index) external onlyAdmin {
        treaties[index].ratified = true;
    }

    function getTreaty(uint256 index) external view returns (TreatyEntry memory) {
        return treaties[index];
    }
}
