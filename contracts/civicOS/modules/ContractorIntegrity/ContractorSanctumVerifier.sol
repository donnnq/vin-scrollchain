// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract ContractorSanctumVerifier {
    address public civicAuthority;

    struct SiteStatus {
        string location;
        bool structureExists;
        string currentStructure;
        bool approvedForContinuation;
    }

    struct Contractor {
        string name;
        string licenseID;
        bool isVerified;
    }

    mapping(address => Contractor) public contractors;
    mapping(string => SiteStatus) public sanctumSites;

    event ContractorVerified(address contractor, string name);
    event SiteVerified(string location, bool continuationApproved);
    event ProjectInitialized(address contractor, string location, string mode);

    modifier onlyAuthority() {
        require(msg.sender == civicAuthority, "Only civic authority can perform this action");
        _;
    }

    constructor() {
        civicAuthority = msg.sender;
    }

    function verifyContractor(address _addr, string memory _name, string memory _licenseID) public onlyAuthority {
        contractors[_addr] = Contractor(_name, _licenseID, true);
        emit ContractorVerified(_addr, _name);
    }

    function verifySite(string memory _location, bool _structureExists, string memory _currentStructure, bool _approvedForContinuation) public onlyAuthority {
        sanctumSites[_location] = SiteStatus(_location, _structureExists, _currentStructure, _approvedForContinuation);
        emit SiteVerified(_location, _approvedForContinuation);
    }

    function initializeProject(address _contractor, string memory _location) public onlyAuthority {
        require(contractors[_contractor].isVerified, "Contractor not verified");
        SiteStatus memory site = sanctumSites[_location];
        string memory mode = site.structureExists && site.approvedForContinuation ? "Continuation" : "Fresh Start";
        emit ProjectInitialized(_contractor, _location, mode);
    }

    function getSiteStatus(string memory _location) public view returns (SiteStatus memory) {
        return sanctumSites[_location];
    }
}
