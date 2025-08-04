// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract vinChronosSigil {
    address public sigilKeeper;

    struct Sigil {
        bytes32 scrollHash;
        string mnemonic;
        uint256 timestamp;
        string phase;
    }

    Sigil[] public sigilLedger;
    mapping(bytes32 => bool) public seenScrolls;

    event SigilBound(bytes32 indexed scrollHash, string mnemonic, string phase, uint256 timestamp);

    modifier onlyKeeper() {
        require(msg.sender == sigilKeeper, "Not sigil keeper");
        _;
    }

    constructor() {
        sigilKeeper = msg.sender;
    }

    function bindSigil(
        bytes32 scrollHash,
        string calldata mnemonic,
        string calldata phase
    ) external onlyKeeper {
        require(!seenScrolls[scrollHash], "Sigil already bound");
        sigilLedger.push(Sigil({
            scrollHash: scrollHash,
            mnemonic: mnemonic,
            timestamp: block.timestamp,
            phase: phase
        }));
        seenScrolls[scrollHash] = true;
        emit SigilBound(scrollHash, mnemonic, phase, block.timestamp);
    }

    function getSigilByIndex(uint256 index) external view returns (
        bytes32, string memory, uint256, string memory
    ) {
        Sigil memory s = sigilLedger[index];
        return (
            s.scrollHash,
            s.mnemonic,
            s.timestamp,
            s.phase
        );
    }

    function totalSigils() external view returns (uint256) {
        return sigilLedger.length;
    }
}
