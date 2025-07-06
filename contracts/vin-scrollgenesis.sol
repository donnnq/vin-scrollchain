// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollGenesis {
    struct Genesis {
        string name;
        string essence;
        string origin;
        string proclamation;
        address creator;
        uint256 timestamp;
    }

    Genesis public genesis;
    bool public sealed;
    address public immutable flameBearer;

    event GenesisDeclared(string name, string essence, string origin, string proclamation, address creator, uint256 timestamp);
    event GenesisSealed(uint256 timestamp);

    modifier onlyBearer() {
        require(msg.sender == flameBearer, "Not the flame bearer");
        _;
    }

    constructor() {
        flameBearer = msg.sender;
    }

    function declareGenesis(
        string calldata name,
        string calldata essence,
        string calldata origin,
        string calldata proclamation
    ) external onlyBearer {
        require(!sealed, "Genesis already sealed");

        genesis = Genesis({
            name: name,
            essence: essence,
            origin: origin,
            proclamation: proclamation,
            creator: msg.sender,
            timestamp: block.timestamp
        });

        emit GenesisDeclared(name, essence, origin, proclamation, msg.sender, block.timestamp);
    }

    function sealGenesis() external onlyBearer {
        require(!sealed, "Already sealed");
        sealed = true;
        emit GenesisSealed(block.timestamp);
    }

    function getGenesis() external view returns (Genesis memory) {
        return genesis;
    }
}
