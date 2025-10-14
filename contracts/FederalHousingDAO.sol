// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FederalHousingDAO {
    address public admin;
    uint256 public housingFund;

    struct Municipality {
        string name;
        bool verified;
        uint256 grantsReceived;
    }

    mapping(address => Municipality) public municipalities;

    constructor() {
        admin = msg.sender;
        housingFund = 0;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fundHousingDAO() external payable onlyAdmin {
        housingFund += msg.value;
    }

    function verifyMunicipality(address _addr, string memory _name) external onlyAdmin {
        municipalities[_addr] = Municipality(_name, true, 0);
    }

    function requestGrant(address _addr, uint256 _amount) external {
        require(municipalities[_addr].verified, "Not verified");
        require(_amount <= housingFund, "Insufficient funds");
        municipalities[_addr].grantsReceived += _amount;
        housingFund -= _amount;
        payable(_addr).transfer(_amount);
    }
}
