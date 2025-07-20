// SPDX-License-Identifier: Mythstream-Emoji
pragma solidity ^0.8.26;

contract ScrollEmojiLedger {
    address public sovereign;
    uint256 public reactionCount;

    enum Emoji { Heart, Fire, Laugh, Shock, Cry, Peace }

    struct Reaction {
        address reactor;
        string scrollName;
        Emoji emoji;
        string reason;
        string timestamp;
    }

    mapping(uint256 => Reaction) public emojiLog;

    event EmojiReacted(address indexed reactor, string scrollName, Emoji emoji, string reason, string timestamp);

    modifier onlySovereign() {
        require(msg.sender == sovereign, "Unauthorized emoji ping");
        _;
    }

    constructor(address _sovereign) {
        sovereign = _sovereign;
    }

    function reactToScroll(
        string memory scrollName,
        Emoji emoji,
        string memory reason,
        string memory timestamp
    ) external {
        reactionCount++;
        emojiLog[reactionCount] = Reaction({
            reactor: msg.sender,
            scrollName: scrollName,
            emoji: emoji,
            reason: reason,
            timestamp: timestamp
        });

        emit EmojiReacted(msg.sender, scrollName, emoji, reason, timestamp);
    }

    function getReaction(uint256 id) external view returns (Reaction memory) {
        return emojiLog[id];
    }
}
