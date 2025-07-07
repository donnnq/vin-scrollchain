// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollVeil {
    struct VeiledScroll {
        address creator;
        string hiddenMeaning;
        bytes32 unlockHash; // keccak256 of phrase or trigger
        uint256 unlockTime;
        bool revealed;
    }

    VeiledScroll[] public scrolls;

    event ScrollVeiled(address indexed creator, uint256 indexed scrollId, uint256 unlockTime);
    event ScrollRevealed(address indexed revealer, uint256 indexed scrollId, string meaning);

    function veilScroll(string calldata hiddenMeaning, string calldata unlockPhrase, uint256 unlockTime) external {
        scrolls.push(VeiledScroll({
            creator: msg.sender,
            hiddenMeaning: hiddenMeaning,
            unlockHash: keccak256(abi.encodePacked(unlockPhrase)),
            unlockTime: unlockTime,
            revealed: false
        }));

        emit ScrollVeiled(msg.sender, scrolls.length - 1, unlockTime);
    }

    function revealScroll(uint256 scrollId, string calldata phrase) external {
        require(scrollId < scrolls.length, "Invalid scroll ID");
        VeiledScroll storage s = scrolls[scrollId];
        require(!s.revealed, "Already revealed");
        require(block.timestamp >= s.unlockTime, "Too early");
        require(keccak256(abi.encodePacked(phrase)) == s.unlockHash, "Incorrect phrase");

        s.revealed = true;
        emit ScrollRevealed(msg.sender, scrollId, s.hiddenMeaning);
    }

    function getScrollStatus(uint256 scrollId) external view returns (
        address creator,
        uint256 unlockTime,
        bool revealed
    ) {
        require(scrollId < scrolls.length, "Invalid scroll ID");
        VeiledScroll storage s = scrolls[scrollId];
        return (s.creator, s.unlockTime, s.revealed);
    }

    function totalScrolls() external view returns (uint256) {
        return scrolls.length;
    }
}
