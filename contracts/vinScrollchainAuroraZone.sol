// SPDX-License-Identifier: Mythstream-NorthernLights
pragma solidity ^0.8.20;

contract vinScrollchainAuroraZone {
    struct AuroraTreaty {
        string region;
        string kiligQuote;
        uint256 treatyTimestamp;
        string auroraColorPalette;
        bool isEmotionallyGlowing;
    }

    AuroraTreaty[] public auroraTreaties;

    event AuroraTreatyRendered(
        string region,
        string kiligQuote,
        uint256 treatyTimestamp,
        string auroraColorPalette,
        bool isEmotionallyGlowing
    );

    function renderAuroraTreaty(
        string memory region,
        string memory quote,
        string memory palette,
        bool glow
    ) public {
        AuroraTreaty memory newTreaty = AuroraTreaty(
            region,
            quote,
            block.timestamp,
            palette,
            glow
        );
        auroraTreaties.push(newTreaty);
        emit AuroraTreatyRendered(region, quote, block.timestamp, palette, glow);
    }

    function latestAuroraTreaty() public view returns (AuroraTreaty memory) {
        require(auroraTreaties.length > 0, "No aurora treaties rendered yet.");
        return auroraTreaties[auroraTreaties.length - 1];
    }
}
