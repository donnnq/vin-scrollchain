// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalCurrencyImmunityDAO {
    address public admin;

    struct ImmunityCase {
        string currency;
        string geopoliticalRisk;
        string immunityProtocol;
        bool activated;
    }

    ImmunityCase[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fileCase(string memory _currency, string memory _geopoliticalRisk, string memory _immunityProtocol) external onlyAdmin {
        cases.push(ImmunityCase(_currency, _geopoliticalRisk, _immunityProtocol, false));
    }

    function activateProtocol(uint256 index) external onlyAdmin {
        cases[index].activated = true;
    }

    function getCase(uint256 index) external view returns (ImmunityCase memory) {
        return cases[index];
    }
}
