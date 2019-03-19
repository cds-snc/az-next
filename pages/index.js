import Link from 'next/link'
import getConfig from 'next/config'

const { publicRuntimeConfig: { githubSha = false } = {} } = getConfig() || {}

const Index = () => (
  <div>
    <h1>Page One</h1>
    <p>Check out page 2 though.</p>
    <Link href="/two">
      <a>Page Two</a>
    </Link>
    <br />
    {githubSha ? (
      <p>
        Last commit:{' '}
        <a
          href={`https://github.com/cds-snc/az-next/commit/${githubSha}`}
        >{`${githubSha}`}</a>
      </p>
    ) : null}
  </div>
)

export default Index
