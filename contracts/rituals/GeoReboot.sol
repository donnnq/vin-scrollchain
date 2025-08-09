// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GeoReboot {
    address public scrollsmith;
    uint256 public rewardAmount = 10_000_000_000; // USD units

    enum Nation {China, Russia}
    enum Status {Pending, Compliant, Rejected, Rebooted}

    struct NationState {
        Status status;
        bool leaderSteppedDown;
        bool rewardClaimed;
        uint256 citizenVoteCount;
        string proposedNewLeader;
    }

    mapping(Nation => NationState) public nations;

    event ProtocolOffered(Nation indexed nation);
    event ComplianceConfirmed(Nation indexed nation);
    event RejectionLogged(Nation indexed nation);
    event LeaderSteppedDown(Nation indexed nation, string newLeader);
    event RewardIssued(Nation indexed nation);
    event CitizenVoted(Nation indexed nation, string candidate);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
        nations[Nation.China].status = Status.Pending;
        nations[Nation.Russia].status = Status.Pending;
    }

    function confirmCompliance(Nation nation) external onlyScrollsmith {
        require(nations[nation].status == Status.Pending, "Already processed");
        nations[nation].status = Status.Compliant;
        emit ComplianceConfirmed(nation);
    }

    function rejectProtocol(Nation nation) external onlyScrollsmith {
        nations[nation].status = Status.Rejected;
        emit RejectionLogged(nation);
    }

    function stepDownLeader(Nation nation, string calldata newLeader) external onlyScrollsmith {
        require(nations[nation].status == Status.Rejected, "Only after rejection");
        nations[nation].leaderSteppedDown = true;
        nations[nation].proposedNewLeader = newLeader;
        nations[nation].status = Status.Rebooted;
        emit LeaderSteppedDown(nation, newLeader);
    }

    function issueReward(Nation nation) external onlyScrollsmith {
        require(nations[nation].status == Status.Compliant, "Not eligible");
        require(!nations[nation].rewardClaimed, "Already claimed");
        nations[nation].rewardClaimed = true;
        emit RewardIssued(nation);
    }

    function voteNewLeader(Nation nation, string calldata candidate) external {
        require(nations[nation].status == Status.Rebooted, "Voting not open");
        nations[nation].citizenVoteCount++;
        emit CitizenVoted(nation, candidate);
    }

    function getNationState(Nation nation) external view returns (NationState memory) {
        return nations[nation];
    }
}
