// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicRedemptionDAO {
    address public admin;

    struct RedemptionCase {
        string name;
        string offense;
        string redemptionAct;
        bool redeemed;
    }

    RedemptionCase[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fileCase(string memory _name, string memory _offense, string memory _redemptionAct) external onlyAdmin {
        cases.push(RedemptionCase(_name, _offense, _redemptionAct, false));
    }

    function markRedeemed(uint256 index) external onlyAdmin {
        cases[index].redeemed = true;
    }

    function getCase(uint256 index) external view returns (RedemptionCase memory) {
        return cases[index];
    }
}
