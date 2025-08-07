// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract vinVowLedgerMirror {
    address public mirrorKeeper;

    struct VowRecord {
        bytes32 vowHash;
        string purpose;
        string originProtocol;
        string destinationProtocol;
        address curator;
        uint256 timestamp;
    }

    VowRecord[] public ledger;
    mapping(bytes32 => bool) public seenVows;

    event VowReflected(bytes32 indexed vowHash, string purpose, string originProtocol, string destinationProtocol);

    modifier onlyKeeper() {
        require(msg.sender == mirrorKeeper, "Not mirror keeper");
        _;
    }

    constructor() {
        mirrorKeeper = msg.sender;
    }

    function reflectVow(
        bytes32 vowHash,
        string calldata purpose,
        string calldata originProtocol,
        string calldata destinationProtocol,
        address curator
    ) external onlyKeeper {
        require(!seenVows[vowHash], "Already mirrored");
        ledger.push(VowRecord({
            vowHash: vowHash,
            purpose: purpose,
            originProtocol: originProtocol,
            destinationProtocol: destinationProtocol,
            curator: curator,
            timestamp: block.timestamp
        }));

        seenVows[vowHash] = true;
        emit VowReflected(vowHash, purpose, originProtocol, destinationProtocol);
    }

    function getVowCount() external view returns (uint256) {
        return ledger.length;
    }

    function getVowByIndex(uint256 index) external view returns (
        bytes32, string memory, string memory, string memory, address, uint256
    ) {
        VowRecord memory record = ledger[index];
        return (
            record.vowHash,
            record.purpose,
            record.originProtocol,
            record.destinationProtocol,
            record.curator,
            record.timestamp
        );
    }
}
