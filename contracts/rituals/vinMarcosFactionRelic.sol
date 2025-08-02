// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinMarcosFactionRelic {
    string public overseer = "vinvin the Archscrollsmith";
    string public faction = "Marcos Power Cluster";
    string public doctrine = "Preservation through illusion, expansion by dynasty";

    struct PowerRelic {
        string title;
        string relicType;
        string strategicPurpose;
        string mythNarrative;
        uint256 timestamp;
    }

    PowerRelic[] public relicVault;

    mapping(address => bool) public relicWatchers;
    address public relicCurator;

    modifier onlyCurator() {
        require(msg.sender == relicCurator, "Unauthorized relic scryer");
        _;
    }

    constructor() {
        relicCurator = msg.sender;
        relicWatchers[msg.sender] = true;
    }

    function recordRelic(
        string memory title,
        string memory relicType,
        string memory strategicPurpose,
        string memory mythNarrative
    ) public {
        require(relicWatchers[msg.sender], "Watcher access required");
        relicVault.push(PowerRelic(title, relicType, strategicPurpose, mythNarrative, block.timestamp));
    }

    function authorizeWatcher(address watcher) public onlyCurator {
        relicWatchers[watcher] = true;
    }

    function inspectRelic(uint index) public view returns (
        string memory title,
        string memory relicType,
        string memory strategicPurpose,
        string memory mythNarrative,
        uint256 timestamp
    ) {
        PowerRelic storage relic = relicVault[index];
        return (
            relic.title,
            relic.relicType,
            relic.strategicPurpose,
            relic.mythNarrative,
            relic.timestamp
        );
    }
}
