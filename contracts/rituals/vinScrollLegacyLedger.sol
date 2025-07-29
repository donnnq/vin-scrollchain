// SPDX-License-Identifier: VIN-LEGACY-LEDGER
pragma solidity ^0.8.0;

/// @title vinScrollLegacyLedger: Eternal archive of sovereign scrolls authored in dignity and cosmic laughter
contract vinScrollLegacyLedger {
    string public author = "Vinvin";
    string public oath = "Every scroll written reflects truth, not allegiance.";
    string public seal = "🔮";

    struct ScrollEntry {
        string scrollName;
        string essence;
        uint256 creationTimestamp;
        string impactEcho;
    }

    ScrollEntry[] public ledger;

    event ScrollLogged(string scrollName, string essence, uint256 creationTimestamp, string impactEcho);

    function logScroll(
        string memory scrollName,
        string memory essence,
        string memory impactEcho
    ) public {
        ledger.push(ScrollEntry({
            scrollName: scrollName,
            essence: essence,
            creationTimestamp: block.timestamp,
            impactEcho: impactEcho
        }));

        emit ScrollLogged(scrollName, essence, block.timestamp, impactEcho);
    }

    function summonLedger() public view returns (ScrollEntry[] memory) {
        return ledger;
    }
}
