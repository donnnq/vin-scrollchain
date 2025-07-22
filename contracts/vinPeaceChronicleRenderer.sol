// SPDX-License-Identifier: Mythstream-Archive
pragma solidity ^0.8.20;

contract vinPeaceChronicleRenderer {
    struct Chronicle {
        string region;
        string treatyScrollName;
        string sentiment;
        uint256 timestamp;
        string scrollkeeperQuote;
    }

    Chronicle[] public archive;

    event ChronicleLogged(
        string region,
        string treatyScrollName,
        string sentiment,
        uint256 timestamp,
        string scrollkeeperQuote
    );

    function logPeaceEvent(
        string memory region,
        string memory name,
        string memory sentiment,
        string memory quote
    ) public {
        Chronicle memory entry = Chronicle(
            region,
            name,
            sentiment,
            block.timestamp,
            quote
        );
        archive.push(entry);
        emit ChronicleLogged(region, name, sentiment, block.timestamp, quote);
    }

    function renderLatestChronicle() public view returns (Chronicle memory) {
        require(archive.length > 0, "No chronicles available yet.");
        return archive[archive.length - 1];
    }
}
