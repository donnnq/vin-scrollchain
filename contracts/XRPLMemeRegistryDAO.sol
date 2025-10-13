// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract XRPLMemeRegistryDAO {
    address public steward;

    struct MemeEvent {
        string memeTitle;
        string ledgerReference; // "Trustline UX", "Wallet Absence", "XRPfi Vaults"
        string memeType; // "Satire", "Parody", "Animated Thread"
        string emotionalTag;
        uint256 timestamp;
    }

    MemeEvent[] public events;

    event MemeLogged(
        string memeTitle,
        string ledgerReference,
        string memeType,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log XRPL meme rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logMeme(
        string memory memeTitle,
        string memory ledgerReference,
        string memory memeType,
        string memory emotionalTag
    ) external onlySteward {
        events.push(MemeEvent({
            memeTitle: memeTitle,
            ledgerReference: ledgerReference,
            memeType: memeType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit MemeLogged(memeTitle, ledgerReference, memeType, emotionalTag, block.timestamp);
    }

    function getMemeByIndex(uint256 index) external view returns (
        string memory memeTitle,
        string memory ledgerReference,
        string memory memeType,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        MemeEvent memory m = events[index];
        return (
            m.memeTitle,
            m.ledgerReference,
            m.memeType,
            m.emotionalTag,
            m.timestamp
        );
    }
}
