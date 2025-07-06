// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVinScrollSigil {
    function getSigil(uint256 id) external view returns (
        string memory name,
        string memory effect,
        string memory alignment,
        address bearer,
        bool active,
        uint256 timestamp
    );
}

interface IVinScrollRelics {
    function getRelic(uint256 id) external view returns (
        string memory name,
        string memory effect,
        string memory origin,
        address holder,
        bool active,
        uint256 timestamp
    );
}

contract VinScrollSupernova {
    struct Requirement {
        uint256 sigilId;
        uint256 relicId;
    }

    Requirement[] public ignitionKeys;
    IVinScrollSigil public sigilContract;
    IVinScrollRelics public relicContract;
    address public immutable ignitionMaster;
    bool public ignited;

    event SupernovaPrepared(uint256 indexed index, uint256 sigilId, uint256 relicId);
    event SupernovaIgnited(address indexed by, string prophecy, uint256 timestamp);

    modifier onlyMaster() {
        require(msg.sender == ignitionMaster, "Not the ignition master");
        _;
    }

    constructor(address sigilAddr, address relicAddr) {
        ignitionMaster = msg.sender;
        sigilContract = IVinScrollSigil(sigilAddr);
        relicContract = IVinScrollRelics(relicAddr);
        ignited = false;
    }

    function addIgnitionKey(uint256 sigilId, uint256 relicId) external onlyMaster {
        ignitionKeys.push(Requirement({ sigilId: sigilId, relicId: relicId }));
        emit SupernovaPrepared(ignitionKeys.length - 1, sigilId, relicId);
    }

    function ignite(string calldata prophecy) external {
        require(!ignited, "Already ignited");

        for (uint256 i = 0; i < ignitionKeys.length; i++) {
            (,,, address sigilBearer, bool sigilActive,) = sigilContract.getSigil(ignitionKeys[i].sigilId);
            (,,, address relicHolder, bool relicActive,) = relicContract.getRelic(ignitionKeys[i].relicId);

            require(sigilActive && relicActive, "Inactive sigil or relic");
            require(sigilBearer == msg.sender && relicHolder == msg.sender, "You do not hold the required items");
        }

        ignited = true;
        emit SupernovaIgnited(msg.sender, prophecy, block.timestamp);
    }

    function totalKeys() external view returns (uint256) {
        return ignitionKeys.length;
    }
}
