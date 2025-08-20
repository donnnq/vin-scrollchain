// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract LicenseIntegrityClause {
    address public civicAuthority;
    mapping(address => Contractor) public contractors;

    struct Contractor {
        string name;
        string licenseID;
        bool isVerified;
        bool hasGhosted;
        uint256 totalContracts;
    }

    event ContractAwarded(address contractor, string projectTitle, uint256 budget);
    event LicenseRevoked(address contractor, string reason);

    modifier onlyVerified(address _contractor) {
        require(contractors[_contractor].isVerified, "Contractor not verified");
        require(!contractors[_contractor].hasGhosted, "Ghost contractor detected");
        _;
    }

    constructor() {
        civicAuthority = msg.sender;
    }

    function registerContractor(address _addr, string memory _name, string memory _licenseID) public {
        require(msg.sender == civicAuthority, "Only civic authority can register");
        contractors[_addr] = Contractor(_name, _licenseID, true, false, 0);
    }

    function awardContract(address _contractor, string memory _projectTitle, uint256 _budget) public onlyVerified(_contractor) {
        contractors[_contractor].totalContracts += 1;
        emit ContractAwarded(_contractor, _projectTitle, _budget);
    }

    function flagGhosting(address _contractor, string memory _reason) public {
        require(msg.sender == civicAuthority, "Only civic authority can flag");
        contractors[_contractor].hasGhosted = true;
        emit LicenseRevoked(_contractor, _reason);
    }
}
