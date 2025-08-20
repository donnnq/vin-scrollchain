// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract ContractorSanctumAudit {
    address public civicAuthority;

    struct Contractor {
        string name;
        string licenseID;
        bool isVerified;
    }

    struct Site {
        string location;
        bool structureExists;
        bool approvedForContinuation;
        string civicPurpose;
        string emotionalResonance;
    }

    struct ContractBundle {
        address contractor;
        string siteLocation;
        uint256 budget;
        string mode; // "Fresh Start" or "Continuation"
    }

    mapping(address => Contractor) public contractors;
    mapping(string => Site) public sites;
    ContractBundle[] public bundles;

    event BundleCreated(address contractor, string siteLocation, uint256 budget, string mode);

    modifier onlyAuthority() {
        require(msg.sender == civicAuthority, "Only civic authority can perform this action");
        _;
    }

    constructor() {
        civicAuthority = msg.sender;
    }

    function registerContractor(address _addr, string memory _name, string memory _licenseID) public onlyAuthority {
        contractors[_addr] = Contractor(_name, _licenseID, true);
    }

    function registerSite(string memory _location, bool _exists, bool _approved, string memory _purpose, string memory _resonance) public onlyAuthority {
        sites[_location] = Site(_location, _exists, _approved, _purpose, _resonance);
    }

    function createBundle(address _contractor, string memory _location, uint256 _budget) public onlyAuthority {
        require(contractors[_contractor].isVerified, "Contractor not verified");
        Site memory site = sites[_location];
        string memory mode = site.structureExists && site.approvedForContinuation ? "Continuation" : "Fresh Start";
        bundles.push(ContractBundle(_contractor, _location, _budget, mode));
        emit BundleCreated(_contractor, _location, _budget, mode);
    }

    function getBundle(uint256 index) public view returns (ContractBundle memory) {
        return bundles[index];
    }
}
