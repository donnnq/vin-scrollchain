// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MunicipalSatireImmunityProtocolDAO {
    address public admin;

    struct SatireCase {
        string quote;
        string city;
        string memeVerdict;
        bool protected;
    }

    SatireCase[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fileCase(string memory _quote, string memory _city, string memory _memeVerdict) external onlyAdmin {
        cases.push(SatireCase(_quote, _city, _memeVerdict, false));
    }

    function grantImmunity(uint256 index) external onlyAdmin {
        cases[index].protected = true;
    }

    function getCase(uint256 index) external view returns (SatireCase memory) {
        return cases[index];
    }
}
