// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract BarangayForeignAidDeck {
    address public steward;
    mapping(string => address[]) public barangayContractors;
    mapping(address => ContractorProfile) public contractorProfiles;

    struct ContractorProfile {
        string origin;
        string specialty;
        bool sahodEligible;
        bool active;
    }

    event ContractorSummoned(address indexed contractor, string barangay, string origin, string specialty);
    event SahodBlessed(address indexed contractor, uint256 amount);
    event ContractorRetired(address indexed contractor);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function summonContractor(
        address contractor,
        string memory barangay,
        string memory origin,
        string memory specialty
    ) public onlySteward {
        ContractorProfile memory profile = ContractorProfile(origin, specialty, true, true);
        contractorProfiles[contractor] = profile;
        barangayContractors[barangay].push(contractor);
        emit ContractorSummoned(contractor, barangay, origin, specialty);
    }

    function blessSahod(address contractor) public onlySteward {
        require(contractorProfiles[contractor].sahodEligible, "Not sahod-eligible");
        require(contractorProfiles[contractor].active, "Contractor inactive");
        emit SahodBlessed(contractor, 1 ether); // Placeholder amount
    }

    function retireContractor(address contractor) public onlySteward {
        contractorProfiles[contractor].active = false;
        emit ContractorRetired(contractor);
    }

    function getContractorsByBarangay(string memory barangay) public view returns (address[] memory) {
        return barangayContractors[barangay];
    }
}
