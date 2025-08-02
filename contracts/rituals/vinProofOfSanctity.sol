// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinProofOfSanctity {
    mapping(address => bool) public verifiedEntities;
    event EntityVerified(address entity);

    function verifySanctity(address entity, bytes calldata proof) public {
        require(proof.length > 0, "Missing proof");
        verifiedEntities[entity] = true;
        emit EntityVerified(entity);
    }
}
