// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DollarDiplomacyDAO {
    address public admin;

    struct Treaty {
        string country;
        string dollarUseCase;
        string sovereigntyScore;
        bool ratified;
    }

    Treaty[] public treaties;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTreaty(string memory _country, string memory _dollarUseCase, string memory _sovereigntyScore) external onlyAdmin {
        treaties.push(Treaty(_country, _dollarUseCase, _sovereigntyScore, false));
    }

    function ratifyTreaty(uint256 index) external onlyAdmin {
        treaties[index].ratified = true;
    }

    function getTreaty(uint256 index) external view returns (Treaty memory) {
        return treaties[index];
    }
}
