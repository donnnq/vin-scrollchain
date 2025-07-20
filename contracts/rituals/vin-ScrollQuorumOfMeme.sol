// SPDX-License-Identifier: Mythstream-MemeGov
pragma solidity ^0.8.26;

contract ScrollQuorumOfMeme {
    address public sovereign;
    uint256 public memeCount;

    struct MemePoll {
        string memeTopic;
        string contextNote;
        uint256 upvotes;
        uint256 downvotes;
        string timestamp;
        address initiator;
    }

    mapping(uint256 => MemePoll) public memeLedger;

    event MemeQuorumStarted(
        string memeTopic,
        string contextNote,
        string timestamp,
        address indexed initiator
    );

    event MemeVoteCast(uint256 indexed memeId, bool upvote);

    modifier onlyScrollAgent() {
        require(msg.sender != address(0), "Unauthorized meme caster");
        _;
    }

    constructor(address _sovereign) {
        sovereign = _sovereign;
    }

    function startMemeQuorum(
        string memory memeTopic,
        string memory contextNote,
        string memory timestamp
    ) external onlyScrollAgent {
        memeCount++;
        memeLedger[memeCount] = MemePoll({
            memeTopic: memeTopic,
            contextNote: contextNote,
            upvotes: 0,
            downvotes: 0,
            timestamp: timestamp,
            initiator: msg.sender
        });

        emit MemeQuorumStarted(memeTopic, contextNote, timestamp, msg.sender);
    }

    function castVote(uint256 memeId, bool upvote) external onlyScrollAgent {
        MemePoll storage poll = memeLedger[memeId];
        if (upvote) {
            poll.upvotes++;
        } else {
            poll.downvotes++;
        }
        emit MemeVoteCast(memeId, upvote);
    }

    function getMemePoll(uint256 memeId) external view returns (MemePoll memory) {
        return memeLedger[memeId];
    }
}
