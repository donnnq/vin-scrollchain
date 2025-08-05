// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./vinCivicFlagger.sol";
import "./vinCivicVerdictEngine.sol";

contract vinCongressWealthAuditScroll {
    struct SALN {
        uint256 netWorth;
        uint256 liabilities;
        uint256 year;
        string docHash; // IPFS or Arweave reference
        bool flagged;
    }

    address public auditDAO;
    mapping(address => string) public congressAlias;
    mapping(address => SALN[]) public salnRecords;

    event SALNSubmitted(address indexed congressMember, uint256 year, uint256 netWorth);
    event SALNFlagged(address indexed congressMember, uint256 year);
    event VerdictSummoned(address indexed congressMember);

    modifier onlyDAO() {
        require(msg.sender == auditDAO, "Not authorized");
        _;
    }

    constructor(address _auditDAO) {
        auditDAO = _auditDAO;
    }

    function submitSALN(
        address _member,
        uint256 _netWorth,
        uint256 _liabilities,
        uint256 _year,
        string memory _docHash
    ) public onlyDAO {
        SALN memory newSALN = SALN({
            netWorth: _netWorth,
            liabilities: _liabilities,
            year: _year,
            docHash: _docHash,
            flagged: false
        });

        salnRecords[_member].push(newSALN);
        emit SALNSubmitted(_member, _year, _netWorth);
    }

    function flagSALN(address _member, uint256 _year) public {
        SALN[] storage records = salnRecords[_member];
        for (uint256 i = 0; i < records.length; i++) {
            if (records[i].year == _year && !records[i].flagged) {
                records[i].flagged = true;
                emit SALNFlagged(_member, _year);

                if (vinCivicFlagger.totalFlags(_member) >= 3) {
                    vinCivicVerdictEngine.summonVerdict(_member);
                    emit VerdictSummoned(_member);
                }
                break;
            }
        }
    }

    function linkAlias(address _member, string memory _alias) public onlyDAO {
        congressAlias[_member] = _alias;
    }

    function fetchSALN(address _member) public view returns (SALN[] memory) {
        return salnRecords[_member];
    }
}
