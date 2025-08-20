// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract CitizenDemandScroll {
    address public steward;
    uint256 public totalDemands;

    struct Demand {
        address citizen;
        string location;
        string issue;
        string evidenceLink;
        string emotionalNote;
        uint256 timestamp;
        bool verified;
    }

    mapping(uint256 => Demand) public demands;
    mapping(address => uint256[]) public citizenLogs;

    event DemandLogged(address indexed citizen, uint256 demandId, string issue);
    event DemandVerified(uint256 demandId, string location, string issue);

    modifier onlySteward() {
        require(msg.sender == steward, "Only steward can verify demands");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logDemand(string memory _location, string memory _issue, string memory _evidenceLink, string memory _note) public {
        demands[totalDemands] = Demand(
            msg.sender,
            _location,
            _issue,
            _evidenceLink,
            _note,
            block.timestamp,
            false
        );
        citizenLogs[msg.sender].push(totalDemands);
        emit DemandLogged(msg.sender, totalDemands, _issue);
        totalDemands++;
    }

    function verifyDemand(uint256 _demandId) public onlySteward {
        demands[_demandId].verified = true;
        emit DemandVerified(_demandId, demands[_demandId].location, demands[_demandId].issue);
    }

    function getCitizenDemands(address _citizen) public view returns (uint256[] memory) {
        return citizenLogs[_citizen];
    }

    function getDemand(uint256 _demandId) public view returns (Demand memory) {
        return demands[_demandId];
    }
}
