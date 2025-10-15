// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokSovereigntyInvestmentPackDAO {
    address public admin;

    struct InvestmentEntry {
        string purokOrBarangay;
        string investmentTheme;
        string sovereigntyClause;
        string emotionalTag;
        bool activated;
    }

    InvestmentEntry[] public pack;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitInvestment(string memory _purokOrBarangay, string memory _investmentTheme, string memory _sovereigntyClause, string memory _emotionalTag) external onlyAdmin {
        pack.push(InvestmentEntry(_purokOrBarangay, _investmentTheme, _sovereigntyClause, _emotionalTag, false));
    }

    function activateInvestment(uint256 index) external onlyAdmin {
        pack[index].activated = true;
    }

    function getInvestment(uint256 index) external view returns (InvestmentEntry memory) {
        return pack[index];
    }
}
