'use client';

import { ApolloClient, InMemoryCache, ApolloProvider } from '@apollo/client';
import { useQuery, gql } from '@apollo/client';

const client = new ApolloClient({
  uri: 'https://localhost:58000/graphql',
  cache: new InMemoryCache(),
});

const GET_USERS = gql`
    query MyQuery {
        users(first: 10) {
            data {
                email
                id
                name
                updated_at
            }
        }
    }
`;

function DisplayUsers() {
  const { loading, error, data } = useQuery(GET_USERS);

  console.log(data);

  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error : {error.message}</p>;

  return data.users.data.map(({ email, id, name, updated_at }) => (
    <div 
      key={id}
      style={{ width: '90%', backgroundColor: '#0f0f0f', padding: '10px', margin: '10px 10px' }}
    >
      <h3>Name: {name} [id: {id}]</h3>
      <p>Email: {email}</p>
      <p>Updated: {updated_at}</p>
    </div>
  ));
}

export default function Home() {
  return (
    <>
      <ApolloProvider client={client}>
        <DisplayUsers />
      </ApolloProvider>
    </>
  );
}
