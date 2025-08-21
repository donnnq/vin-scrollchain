// SPDX-License-Identifier: Mythic-Planetary
pragma solidity ^0.8.19;

contract vinScrollchainChronicle {
    struct ChronicleEntry {
        string chapterTitle;
        string steward;
        string scrollName;
        string legendNote;
        uint256 timestamp;
    }

    ChronicleEntry[] public chronicle;

    event ChapterLogged(string chapterTitle, string steward, string scrollName);

    function logChapter(
        string memory chapterTitle,
        string memory steward,
        string memory scrollName,
        string memory legendNote
    ) public {
        chronicle.push(ChronicleEntry(chapterTitle, steward, scrollName, legendNote, block.timestamp));
        emit ChapterLogged(chapterTitle, steward, scrollName);
    }

    function getChronicle() public view returns (ChronicleEntry[] memory) {
        return chronicle;
    }
}
