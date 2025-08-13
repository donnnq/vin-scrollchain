// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinWitnessLedger {
    struct Testimony {
        uint timestamp;
        string region;
        string contractorName;
        string corruptionPattern;
        string encryptedDetails;
        address witness;
    }

    Testimony[] private testimonies;

    event TestimonyLogged(string region, string contractor);

    function logTestimony(
        string memory region,
        string memory contractorName,
        string memory corruptionPattern,
        string memory encryptedDetails
    ) public {
        testimonies.push(Testimony({
            timestamp: block.timestamp,
            region: region,
            contractorName: contractorName,
            corruptionPattern: corruptionPattern,
            encryptedDetails: encryptedDetails,
            witness: msg.sender
        }));

        emit TestimonyLogged(region, contractorName);
    }

    function getTestimony(uint index) public view returns (
        uint, string memory, string memory, string memory, string memory, address
    ) {
        Testimony memory t = testimonies[index];
        return (
            t.timestamp,
            t.region,
            t.contractorName,
            t.corruptionPattern,
            t.encryptedDetails,
            t.witness
        );
    }

    function totalTestimonies() public view returns (uint) {
        return testimonies.length;
    }
}
