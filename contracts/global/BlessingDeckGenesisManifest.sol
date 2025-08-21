// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

contract BlessingDeckGenesisManifest {
    struct ManifestEntry {
        string moduleName;
        string originScroll;
        string purpose;
        string mythicLineage;
        uint256 timestamp;
    }

    ManifestEntry[] public genesisManifest;

    event ManifestLogged(string moduleName, string originScroll);

    function logManifest(
        string memory _moduleName,
        string memory _originScroll,
        string memory _purpose,
        string memory _mythicLineage
    ) public {
        genesisManifest.push(ManifestEntry({
            moduleName: _moduleName,
            originScroll: _originScroll,
            purpose: _purpose,
            mythicLineage: _mythicLineage,
            timestamp: block.timestamp
        }));

        emit ManifestLogged(_moduleName, _originScroll);
    }

    function getManifest() public view returns (ManifestEntry[] memory) {
        return genesisManifest;
    }
}
