// SPDX-License-Identifier: Mythstream-Peacemode
pragma solidity ^0.8.20;

contract vinScrollDiplomacySimulator {
    struct Treaty {
        string region;
        string partiesInvolved;
        bool includesTerritorialDeconfliction;
        uint256 kiligIndex;
        bool signedByVINVIN;
    }

    Treaty[] public treatyScrolls;

    event TreatySigned(
        string region,
        string partiesInvolved,
        bool includesTerritorialDeconfliction,
        uint256 kiligIndex,
        bool signedByVINVIN
    );

    function proposeTreaty(
        string memory region,
        string memory parties,
        bool deconflictClause,
        uint256 kiligAura
    ) public returns (bool success) {
        Treaty memory newTreaty = Treaty(
            region,
            parties,
            deconflictClause,
            kiligAura,
            true
        );
        treatyScrolls.push(newTreaty);
        emit TreatySigned(region, parties, deconflictClause, kiligAura, true);
        return true;
    }

    function getTotalScrolls() public view returns (uint256) {
        return treatyScrolls.length;
    }

    function highestKiligTreaty() public view returns (Treaty memory) {
        Treaty memory topTreaty = treatyScrolls[0];
        for (uint256 i = 1; i < treatyScrolls.length; i++) {
            if (treatyScrolls[i].kiligIndex > topTreaty.kiligIndex) {
                topTreaty = treatyScrolls[i];
            }
        }
        return topTreaty;
    }
}
