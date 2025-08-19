// SPDX-License-Identifier: Civic-Mythic
pragma solidity ^0.8.21;

contract ContractorSanctum {
    struct Contractor {
        string name;
        string region;
        uint256 totalProjects;
        uint256 flaggedProjects;
        uint256 civicResonance;
        bool isSanctified;
    }

    mapping(address => Contractor) public contractors;
    address public registrar;

    event ContractorLogged(address indexed contractor, string name, string region);
    event ProjectFlagged(address indexed contractor);
    event ResonanceUpdated(address indexed contractor, uint256 score);
    event SanctumStatusUpdated(address indexed contractor, bool status);

    modifier onlyRegistrar() {
        require(msg.sender == registrar, "Unauthorized sanctum access.");
        _;
    }

    constructor() {
        registrar = msg.sender;
    }

    function logContractor(
        address _contractor,
        string memory _name,
        string memory _region
    ) public onlyRegistrar {
        contractors[_contractor] = Contractor(_name, _region, 0, 0, 100, false);
        emit ContractorLogged(_contractor, _name, _region);
    }

    function flagProject(address _contractor) public onlyRegistrar {
        contractors[_contractor].flaggedProjects += 1;
        emit ProjectFlagged(_contractor);
    }

    function updateResonance(address _contractor, uint256 _score) public onlyRegistrar {
        contractors[_contractor].civicResonance = _score;
        emit ResonanceUpdated(_contractor, _score);
    }

    function sanctifyContractor(address _contractor, bool _status) public onlyRegistrar {
        contractors[_contractor].isSanctified = _status;
        emit SanctumStatusUpdated(_contractor, _status);
    }

    function viewContractor(address _contractor) public view returns (
        string memory name,
        string memory region,
        uint256 totalProjects,
        uint256 flaggedProjects,
        uint256 civicResonance,
        bool isSanctified
    ) {
        Contractor memory c = contractors[_contractor];
        return (
            c.name,
            c.region,
            c.totalProjects,
            c.flaggedProjects,
            c.civicResonance,
            c.isSanctified
        );
    }
}
