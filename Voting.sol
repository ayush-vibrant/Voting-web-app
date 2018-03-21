pragma solidity ^0.4.18;


contract Voting {
    // key -> Name of candidate and value -> vote count
    mapping (bytes32=>uint32) public votesReceived; 
    bytes32[] public candidateList;

    function Voting(bytes32[] candidateNames) {
        candidateList = candidateNames;
    }

    function totalVotesFor(bytes32 candidate) view public returns (uint32) {
        require(validCandidate(candidate));
        return votesReceived[candidate];
    }

    function voteForCandidate(bytes32 candidate) public {
        require(validCandidate(candidate));
        votesReceived[candidate] += 1;
    }

    function validCandidate(bytes32 candidate) view public returns (bool) {
        for (uint i = 0; i < candidateList.length; i++) {
            if (candidateList[i] == candidate) {
                return true;
            }
        }
        return false;
    }
}