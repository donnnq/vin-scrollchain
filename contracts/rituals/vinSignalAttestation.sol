// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinSignalAttestation {
    event AttestedSignal(bytes32 signalHash);

    function attestSignal(string calldata signalMessage) public {
        bytes32 signalHash = keccak256(abi.encodePacked(signalMessage));
        emit AttestedSignal(signalHash);
    }
}
