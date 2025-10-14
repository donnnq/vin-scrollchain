// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GoldilocksPriceAuditDAO {
    address public admin;

    struct CakeAudit {
        string cakeName;
        string branchLocation;
        string priceWithVAT;
        string priceWithoutVAT;
        string emotionalTag;
        bool verified;
    }

    CakeAudit[] public audits;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logAudit(string memory _cakeName, string memory _branchLocation, string memory _priceWithVAT, string memory _priceWithoutVAT, string memory _emotionalTag) external onlyAdmin {
        audits.push(CakeAudit(_cakeName, _branchLocation, _priceWithVAT, _priceWithoutVAT, _emotionalTag, false));
    }

    function verifyAudit(uint256 index) external onlyAdmin {
        audits[index].verified = true;
    }

    function getAudit(uint256 index) external view returns (CakeAudit memory) {
        return audits[index];
    }
}
