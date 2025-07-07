// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVinScrollPantheon {
    function getDeity(address soul) external view returns (
        address soulAddress,
        string memory title,
        string memory domain,
        uint256 ascendedAt,
        bool active
    );
}

contract VinScrollDivineWill {
    enum Verdict { Bless, Curse }

    struct DivineVote {
        address deity;
        Verdict verdict;
        string targetType; // e.g. "Scroll", "Agent", "Ritual"
        address targetAddress;
        string reason;
        uint256 timestamp;
    }

    DivineVote[] public votes;
    IVinScrollPantheon public pantheon;
    address public immutable willkeeper;

    event DivineVerdict(
        address indexed deity,
        Verdict verdict,
        string targetType,
        address indexed target,
        string reason,
        uint256 timestamp
    );

    modifier onlyDeity() {
        (, , , , bool active) = pantheon.getDeity(msg.sender);
        require(active, "Not an active deity");
        _;
    }

    constructor(address pantheonAddr) {
        pantheon = IVinScrollPantheon(pantheonAddr);
        willkeeper = msg.sender;
    }

    function castVerdict(
        Verdict verdict,
        string calldata targetType,
        address targetAddress,
        string calldata reason
    ) external onlyDeity {
        votes.push(DivineVote({
            deity: msg.sender,
            verdict: verdict,
            targetType: targetType,
            targetAddress: targetAddress,
            reason: reason,
            timestamp: block.timestamp
        }));

        emit DivineVerdict(msg.sender, verdict, targetType, targetAddress, reason, block.timestamp);
    }

    function getVote(uint256 id) external view returns (DivineVote memory) {
        require(id < votes.length, "Invalid vote ID");
        return votes[id];
    }

    function totalVotes() external view returns (uint256) {
        return votes.length;
    }
}
