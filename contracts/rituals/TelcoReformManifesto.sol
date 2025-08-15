// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title TelcoReformManifesto
/// @notice Civic scroll declaring the people's demands for telco reform
contract TelcoReformManifesto {
    string public declaration = "The Filipino people demand telco reform: fair billing, fast service, and emotional dignity.";

    struct ReformClause {
        string clause;
        bool isActivated;
    }

    ReformClause[] public clauses;

    event ClauseAdded(string clause);
    event ClauseActivated(string clause);

    function addClause(string memory _clause) public {
        clauses.push(ReformClause({
            clause: _clause,
            isActivated: false
        }));
        emit ClauseAdded(_clause);
    }

    function activateClause(uint256 index) public {
        require(index < clauses.length, "Invalid clause index");
        clauses[index].isActivated = true;
        emit ClauseActivated(clauses[index].clause);
    }

    function getClause(uint256 index) public view returns (ReformClause memory) {
        require(index < clauses.length, "Invalid index");
        return clauses[index];
    }

    function totalClauses() public view returns (uint256) {
        return clauses.length;
    }
}
